resource "google_api_gateway_api" "api_gw" {
  project = var.project_id
  provider = google-beta
  api_id = "api-scareflix-cat"
}

resource "google_api_gateway_api_config" "api_gw" {
  project = var.project_id
  provider = google-beta
  api = google_api_gateway_api.api_gw.api_id
  api_config_id = format("%s-%s","api-scareflix-cat-config",filemd5("../openapi.yaml"))

  openapi_documents {
    document {
      path = "spec.yaml"
      contents = filebase64("../openapi.yaml")
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_api_gateway_gateway" "api_gw" {
  project = var.project_id
  provider = google-beta
  api_config = google_api_gateway_api_config.api_gw.id
  gateway_id = "api-scareflix-gateway"

}