import * as TraceAgent from "@google-cloud/trace-agent";
import tracer, { Tracer } from "dd-trace";

export function setupTracing(name: string): TraceAgent.PluginTypes.Tracer {
  console.log({ name });
  return TraceAgent.start({ enhancedDatabaseReporting: true, samplingRate: 0 });
}

export function setupDatadog(): Tracer {
  return tracer.init();
}
