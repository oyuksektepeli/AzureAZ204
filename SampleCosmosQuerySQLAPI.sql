SELECT * FROM c
WHERE c.address.city = 'Istanbul'

SELECT * FROM c
WHERE IS_DEFINED(c.pets)

SELECT * FROM c
WHERE ARRAY_LENGTH(c.kids) > 2