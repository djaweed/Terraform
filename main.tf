# 1. Dynamically retrieve the current AWS Account ID
data "aws_caller_identity" "current" {}

# 2. Build the IAM trust policy without embedding your account ID
data "aws_iam_policy_document" "trust" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
  }
}

# 3. Create the IAM role using the generated policy
resource "aws_iam_role" "terraform_execution" {
  name               = "TerraformExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.trust.json
}

# 4. Attach your pre‑created TerraformStateAccess managed policy
resource "aws_iam_role_policy_attachment" "state_access" {
  role       = aws_iam_role.terraform_execution.name
  policy_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/TerraformStateAccess"
}
