import logging
from pyats import aetest
from genie.conf import Genie


log = logging.getLogger(__name__)


class CommonSetup(aetest.CommonSetup):
    @aetest.subsection
    def establish_connections(self, testbed):
        genie_testbed = Genie.init(testbed)
        self.parent.parameters['testbed'] = genie_testbed
        device_list = []
        for device in genie_testbed.devices.values():
            log.info(f"Connect to device {device.name}")
            try:
                device.connect()
            except Exception:
                self.failed("Failed to establish connection to '{}'".format(
                    device.name))

            device_list.append(device)
        self.parent.parameters.update(dev=device_list)
        self.parent.parameters.update(desire_vni=[
            50001,
            30001])


class VniTest(aetest.Testcase):
    @aetest.test
    def get_vni(self):
        self.all_vni_status = {}
        for device in self.parent.parameters["dev"]:
            vni = device.parse("show nve vni")
            self.all_vni_status[device.name] = vni["nve1"]["vni"]

    @aetest.test
    def check_vni_status(self):
        result = []
        for device in self.parent.parameters["dev"]:
            log.info(f"Check if all VNI are UP for device {device.name}")
            for key, vni in self.all_vni_status[device.name].items():
                if vni["vni_state"] != "up":
                    result.append({
                        "vni": vni["vni"],
                        "status": vni["vni_state"]
                    })
        if result:
            log.error(result)
            self.failed()

    @aetest.test()
    def desired_vni(self):
        result = []
        for device in self.parent.parameters["dev"]:
            log.info(f"Check if all desired VNI are deployed on device {device.name}")
            for vni in self.parent.parameters["desire_vni"]:
                if vni not in self.all_vni_status[device.name].keys():
                    result.append(vni)
        if result:
            log.error(result)
            self.failed("not all VNI are deployed")


class CommonCleanup(aetest.CommonCleanup):
    @aetest.subsection
    def clean_everything(self):
        """ Common Cleanup Subsection """
        log.info("Aetest Common Cleanup ")


if __name__ == "__main__":
    aetest.main()
