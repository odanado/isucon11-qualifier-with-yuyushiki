import * as TraceAgent from "@google-cloud/trace-agent";

export function setupTracing(name: string): TraceAgent.PluginTypes.Tracer {
  console.log({ name });
  return TraceAgent.start({ enhancedDatabaseReporting: true });
}
