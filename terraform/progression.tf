resource "azurerm_resource_group" "rg-progression-framework" {
    name     = "RG-Progression-Framework"
    location = "North Europe"
    
    tags ={
        "Domain"      = "Personal Development"
        "Environment" = "Prod"
        "Product"     = "Career Framework"
        "Territory"   = "UK"
    }
}

resource "azurerm_storage_account" "progressionframework" {
    name                      = "briprgfwk140916"
    resource_group_name       = azurerm_resource_group.rg-progression-framework.name
    location                  = azurerm_resource_group.rg-progression-framework.location
    
    account_tier              = "Standard"
    account_replication_type  = "LRS"
    account_kind              = "StorageV2"

    static_website {
        index_document     = "index.html"
        error_404_document = "404.html"
    }
}

resource "azurerm_cdn_profile" "progressionframework-cdn-profile" {
    name                = "progression-framework-cdn-profile"
    location            = azurerm_resource_group.rg-progression-framework.location
    resource_group_name = azurerm_resource_group.rg-progression-framework.name
    
    sku                 = "Standard_Microsoft"
          
    depends_on          = [azurerm_storage_account.progressionframework]
}

resource "azurerm_cdn_endpoint" "progressionframework-cdn-endpoint" {
    name                = "progression-framework-cdn-endpoint"
    resource_group_name = azurerm_resource_group.rg-progression-framework.name
    location            = azurerm_resource_group.rg-progression-framework.location

    profile_name        = azurerm_cdn_profile.progressionframework-cdn-profile.name
    is_http_allowed     = false
    origin_host_header  = azurerm_storage_account.progressionframework.primary_web_host
    optimization_type   = "GeneralWebDelivery"
    
    global_delivery_rule {
        cache_expiration_action {
            behavior = "Override"
            duration = "00:05:00"
        }
    }
    is_compression_enabled = true
    content_types_to_compress = [
        "application/eot",
        "application/font",
        "application/font-sfnt",
        "application/javascript",
        "application/json",
        "application/opentype",
        "application/otf",
        "application/pkcs7-mime",
        "application/truetype",
        "application/ttf",
        "application/vnd.ms-fontobject",
        "application/xhtml+xml",
        "application/xml",
        "application/xml+rss",
        "application/x-font-opentype",
        "application/x-font-truetype",
        "application/x-font-ttf",
        "application/x-httpd-cgi",
        "application/x-javascript",
        "application/x-mpegurl",
        "application/x-opentype",
        "application/x-otf",
        "application/x-perl",
        "application/x-ttf",
        "font/eot",
        "font/ttf",
        "font/otf",
        "font/opentype",
        "image/svg+xml",
        "text/css",
        "text/csv",
        "text/html",
        "text/javascript",
        "text/js",
        "text/plain",
        "text/richtext",
        "text/tab-separated-values",
        "text/xml",
        "text/x-script",
        "text/x-component",
        "text/x-java-source"]
  
  origin {
    name       = "progression-framework-${azurerm_storage_account.progressionframework.name}"
    host_name  = azurerm_storage_account.progressionframework.primary_web_host
    https_port = "443"
    }
    
    depends_on = [azurerm_cdn_profile.progressionframework-cdn-profile]
}