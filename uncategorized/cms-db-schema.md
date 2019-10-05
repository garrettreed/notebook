# CMS DB schema

Update: After a lil bit of research I see that I implemented an EAV data model. Actually, one that mimics Magento's, sans "Flat" table. Cool. Moving the Object ID from the Field to the Value tables should allow for sharing fields between objects, but I bet it violates some normalization form. I'll think on it.

Problem this is addressing: Duplicating schema logic in database and application. Also flexibility.

`SELECT first_name FROM Users WHERE id="some-id-here"` requires that the application mimic the schema. But what if it couldn't know the table strucutre? Is is that any different from JSON blobs? We can leverage the database for type enforcement and prevent other integrity violations. Performance is going to suck, and it probably makes indexing useless. It would be great if fields were sharable between objects

## Example

```
User
    - id (uuid)
    - first name (varchar)
    - dob (date)
    - created_at (date)

Event
    - id (uuid)
    - title (varchar)
    - date (date)
    - creator (User ID key)
```

Becomes:

```
Entities
    - ID (id)
    - Name (User|Event|Otherstuff)

Objects
    - ID (id)
    - Entity ID (Entity key)

Fields
    - ID (id)
    - Object ID (Object key)
    - Name (varchar)
    - Type (varchar that maps to the correct value table. Should be normalized and made into a key)

Values_varchar
    - Field ID
    - value

Values_date
    - Field ID
    - value

Values_objects
    - Field ID
    - value
```
