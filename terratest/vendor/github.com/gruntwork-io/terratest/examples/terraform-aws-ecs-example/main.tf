# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY INTO THE DEFAULT VPC AND SUBNETS
# To keep this example simple, we are deploying into the Default VPC and its subnets. In real-world usage, you should
# deploy into a custom VPC and private subnets.
# ---------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE ECS CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_ecs_cluster" "example" {
  name = "${var.cluster_name}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE ECS SERVICE AND ITS TASK DEFINITION
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_ecs_service" "example" {
  name = "${var.service_name}"
  cluster = "${aws_ecs_cluster.example.arn}"
  task_definition = "${aws_ecs_task_definition.example.arn}"
  desired_count = 0
  launch_type = "FARGATE"

  network_configuration {
    subnets = ["${data.aws_subnet_ids.all.ids}"]
  }
}

resource "aws_ecs_task_definition" "example" {
  family = "terratest"
  network_mode = "awsvpc"
  cpu = 256
  memory = 512
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = "${aws_iam_role.execution.arn}"
  container_definitions = <<-JSON
    [
      {
        "image": "terraterst-example",
        "name": "terratest",
        "networkMode": "awsvpc"
      }
    ]
  JSON
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE ECS TASK EXECUTION ROLE AND ATTACH APPROPRIATE AWS MANAGED POLICY
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_iam_role" "execution" {
  name = "${var.cluster_name}-ecs-execution"
  assume_role_policy = "${data.aws_iam_policy_document.assume-execution.json}"
}

resource "aws_iam_role_policy_attachment" "execution" {
  role = "${aws_iam_role.execution.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "assume-execution" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}
