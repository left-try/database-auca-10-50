CREATE OR REPLACE FUNCTION get_active_plan(p_user_id BIGINT)
RETURNS TEXT AS $$
DECLARE
    plan_name TEXT;
BEGIN
    SELECT sp.name
    INTO plan_name
    FROM subscription s
    JOIN subscription_plan sp ON sp.id = s.plan_id
    WHERE s.user_id = p_user_id
      AND s.is_active = TRUE
      AND CURRENT_DATE BETWEEN s.starts_on AND s.ends_on
    LIMIT 1;

    RETURN plan_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION enforce_one_active_subscription()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.is_active THEN
        PERFORM 1
        FROM subscription s
        WHERE s.user_id = NEW.user_id
          AND s.is_active = TRUE
          AND s.id <> COALESCE(NEW.id, -1);

        IF FOUND THEN
            RAISE EXCEPTION 'User % already has an active subscription', NEW.user_id;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_one_active_sub ON subscription;

CREATE TRIGGER trg_one_active_sub
BEFORE INSERT OR UPDATE ON subscription
FOR EACH ROW
EXECUTE FUNCTION enforce_one_active_subscription();
