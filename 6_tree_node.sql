SELECT id, (
    CASE
        WHEN p_id = NULL THEN 'Root'
        WHEN id IN (SELECT DISTINCT p_id FROM tree) THEN 'Inner'
        ELSE 'Leaf'
    END
) AS 'type' FROM tree;