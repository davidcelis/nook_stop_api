require "graphql/rake_task"
require "graphql-docs"

GraphQL::RakeTask.new(schema_name: "NookStopAPISchema")

namespace :graphql do
  namespace :docs do
    task :generate do
      GraphQLDocs.build(schema: "schema.graphql", output_dir: "public/")
    end
  end
end
