resource "aws_service_discovery_service" "this" {
  name         = var.service
  namespace_id = var.dns_namaspace_id

  dns_config {
    namespace_id   = var.dns_namaspace_id
    routing_policy = var.routing_policy

    dns_records {
      ttl  = var.ttl
      type = var.dns_record_type
    }
  }
}