variable "fabric_name" {
  type = string
}

variable "inventory" {
  type = map(any)
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
    switch_id     = string
    template_name = string
    description   = string
    priority      = number
    props         = map(any)
  }))
}
