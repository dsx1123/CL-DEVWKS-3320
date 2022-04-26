variable "ndfc" {
  type = object({
    username = string
    password = string
    url      = string
    platform = string
  })
}

variable "fabric_name" {
  type = string
}

variable "inventory" {
  type = list(string)
}

variable "templates" {
  type = list(object({
    name        = string
    description = string
    file        = string
  }))
}

variable "policies" {
  type = list(object({
    switch_name   = string
    template_name = string
    description   = string
    priority      = number
    props         = map(any)
  }))
}
