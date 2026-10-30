CREATE TABLE IF NOT EXISTS work_orders(id TEXT PRIMARY KEY,title TEXT NOT NULL,description TEXT NOT NULL DEFAULT '',location TEXT NOT NULL DEFAULT '',priority TEXT NOT NULL DEFAULT 'normal',status TEXT NOT NULL DEFAULT 'submitted',assignee_name TEXT,created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,closed_at TEXT);
CREATE TABLE IF NOT EXISTS work_order_events(id TEXT PRIMARY KEY,work_order_id TEXT NOT NULL REFERENCES work_orders(id),action TEXT NOT NULL,note TEXT NOT NULL DEFAULT '',actor TEXT NOT NULL DEFAULT 'system',created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS evidence(id TEXT PRIMARY KEY,work_order_id TEXT NOT NULL REFERENCES work_orders(id),object_key TEXT NOT NULL,content_type TEXT NOT NULL,created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE INDEX IF NOT EXISTS idx_wo_status ON work_orders(status);
CREATE INDEX IF NOT EXISTS idx_events_work_order ON work_order_events(work_order_id);
CREATE INDEX IF NOT EXISTS idx_evidence_work_order ON evidence(work_order_id);
