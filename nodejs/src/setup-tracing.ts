import * as TraceAgent from "@google-cloud/trace-agent";

export function setupTracing(name: string): void {
  console.log({ name });
  TraceAgent.start({ enhancedDatabaseReporting: true });
}
