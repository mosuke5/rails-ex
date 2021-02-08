require 'opentelemetry/sdk'
require 'opentelemetry/exporter/jaeger'

OpenTelemetry::SDK.configure do |c|
  c.use_all
  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      exporter: OpenTelemetry::Exporter::Jaeger::AgentExporter.new(host: 'localhost', port: 6831)
    )
  )
  c.service_name = 'my-app'
  c.service_version = '0.1.0'
end
