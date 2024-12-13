SELECT COUNT(*) INTO @cnt FROM seat;
SELECT (
    CASE
        WHEN MOD(id, 2) != 0 AND id != @cnt THEN id+1
        WHEN MOD(id, 2) != 0 AND id = @cnt THEN id
        ELSE id-1
    END
) AS 'id', student FROM seat ORDER BY id;