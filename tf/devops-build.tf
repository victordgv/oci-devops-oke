resource "oci_devops_build_pipeline" "build_pipeline" {
    project_id = oci_devops_project.devops_project.id

    build_pipeline_parameters {
        items {
            name = "item1"
            default_value = "build pipeline default value for item 1"
            description = "build pipeline description for item 1"
        }
    }
    description = "build_pipeline_${random_string.deploy_id.result}"
    display_name = "build_pipeline_${random_string.deploy_id.result}"

    depends_on = [oci_devops_connection.devops_connection]
}

# resource "oci_devops_build_pipeline_stage" "build_github_stage" {
#   build_pipeline_id = oci_devops_build_pipeline.build_pipeline.id
#   build_pipeline_stage_predecessor_collection {
#     items {
#       id = oci_devops_build_pipeline.build_pipeline.id
#     }
#   }
#   build_pipeline_stage_type = "BUILD"

#   description                        = "Build Github stage"
#   display_name                       = "build_github_stage"
#   build_spec_file                    = "build_spec.yml"
#   image                              = "OL7_X86_64_STANDARD_10"
#   primary_build_source               = "primaryBuildSource"
#   stage_execution_timeout_in_seconds = "10"
#   build_runner_shape_config {
#     build_runner_type = "CUSTOM"
#     memory_in_gbs = 4
#     ocpus = 1
#   }
#   build_source_collection {
#     items {
#       connection_type   = "GITHUB"
#       branch            = "main"
#       connection_id     = oci_devops_connection.devops_connection.id
#       name              = "primaryBuildSource"
#       repository_url    = var.github_repo_url
#     }
#   }
# }