resource "aws_budgets_budget" "ec2" {
  name              = "Ec2MonthlyBudget"
  budget_type       = "COST"
  limit_amount      = "0.1"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2020-11-01_00:00"
  time_unit         = "MONTHLY"

  cost_filters = {
    TagKeyValue = "key$demo"
  }

  cost_types {
    include_credit             = false
    include_discount           = false
    include_other_subscription = false
    include_recurring          = false
    include_refund             = false
    include_subscription       = true
    include_support            = false
    include_tax                = false
    include_upfront            = false
    use_blended                = false
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 85
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["jinojoe@gmail.com"]
  }
}
