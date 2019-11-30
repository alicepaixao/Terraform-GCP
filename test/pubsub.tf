# module "product-types-created-topic" {
#   source               = "../modules/pubsub"
#   topic                = "${var.product_type_create_topic}"
#   project_id           = "${var.project_id}"
#   push_subscriptions   = "${var.product_type_push_subscriptions}"
#   pull_subscriptions   = "${var.product_type_pull_subscriptions}"
# }

# module "product-types-updated-topic" {
#   source               = "../modules/pubsub"
#   topic                = "${var.product_type_updated_topic}"
#   project_id           = "${var.project_id}"
#   push_subscriptions   = "${var.product_type_updated_push_subscriptions}"
#   pull_subscriptions   = "${var.product_type_updated_pull_subscriptions}"
# }

# module "product-types-created-error-topic" {
#   source = "../modules/pubsub"
#   topic                = "${var.product_types_create_error_topic}"
#   project_id           = "${var.project_id}"
#   push_subscriptions   = "${var.product_types_create_error_push_subscription}"
#   pull_subscriptions   = "${var.product_types_create_error_pull_subscription}"
# }

# module "channels-updated-topic" {
#   source               = "../modules/pubsub"
#   topic                = "${var.channels_updated_topic}"
#   project_id           = "${var.project_id}"
#   push_subscriptions   = "${var.channels_updated_push_subscriptions}"
#   pull_subscriptions   = "${var.channels_updated_pull_subscriptions}"
# }

# module "company-updated-topic" {
#   source               = "../modules/pubsub"
#   topic                = "${var.company_updated_topic}"
#   project_id           = "${var.project_id}"
#   push_subscriptions   = "${var.company_updated_push_subscriptions}"
#   pull_subscriptions  = "${var.company_updated_pull_subscriptions}"
# }

# module "company-created-topic" {
#   source = "../modules/pubsub"
#   topic = "${var.company_created_topic}"
#   project_id = "${var.project_id}"
#   push_subscriptions = "${var.company_created_push_subscriptions}"
#   pull_subscriptions = "${var.company_created_pull_subscriptions}"
# }

# module "company-deleted-topic" {
#   source = "../modules/pubsub"
#   topic = "${var.company_deleted_topic}"
#   project_id = "${var.project_id}"
#   push_subscriptions   = "${var.company_deleted_push_subscriptions}"
#   pull_subscriptions  = "${var.company_deleted_pull_subscriptions}"
# }

# module "channel-created-topic" {
#   source = "../modules/pubsub"
#   topic = "${var.channel_created_topic}"
#   project_id = "${var.project_id}"
#   push_subscriptions   = "${var.channel_created_push_subscriptions}"
#   pull_subscriptions  = "${var.channel_created_pull_subscriptions}"
# }

# module "channel-deleted-topic" {
#   source = "../modules/pubsub"
#   topic = "${var.channel_deleted_topic}"
#   project_id = "${var.project_id}"
#   push_subscriptions   = "${var.channel_deleted_push_subscriptions}"
#   pull_subscriptions  = "${var.channel_deleted_pull_subscriptions}"
# }
