import { Tracer } from "dd-trace";
import { Pool, PoolConnection } from "mysql2/promise";

export async function getConnection(
  pool: Pool,
  tracer: Tracer
): Promise<PoolConnection> {
  return tracer.trace("web.getConnection", () => {
    return pool.getConnection();
  });
}
