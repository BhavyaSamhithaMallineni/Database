
-- LeetCode Problem: Delete Duplicate Emails
-- Link: https://leetcode.com/problems/delete-duplicate-emails/
--
-- This SQL query removes duplicate email entries from the Person table.
-- It uses a self-join to compare each row with every other row in the table.
-- The condition p1.Email = p2.Email identifies duplicate emails.
-- The condition p1.Id > p2.Id ensures that among duplicates, only the row 
-- with the higher Id (i.e., not the first occurrence) is deleted.
-- This way, only the record with the smallest Id for each email is retained.
-- This query uses MySQL's multi-table DELETE syntax, which allows deleting
-- from one table using conditions involving another.

DELETE p1
FROM Person p1, Person p2
WHERE p1.Email = p2.Email AND p1.Id > p2.Id;


