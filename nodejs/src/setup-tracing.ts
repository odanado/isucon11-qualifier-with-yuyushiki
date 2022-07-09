import * as TraceAgent from "@google-cloud/trace-agent";
import tracer, { Tracer } from "dd-trace";
import { execSync } from "child_process"

export function setupTracing(name: string): TraceAgent.PluginTypes.Tracer {
  console.log({ name });
  return TraceAgent.start({ enhancedDatabaseReporting: true, samplingRate: 0 });
}

export function setupDatadog(): Tracer {
  const currentCommitHash = execSync("cd ~/webapp/nodejs/; git rev-parse HEAD").toString().trim()
  return tracer.init({
    version: currentCommitHash,
    profiling: true,
    service: "isucon11-qualifier"
  });
}
