DELETE FROM contacts;
DELETE FROM address_book;

INSERT INTO address_book (id,"name",user_name) VALUES
    (1,'test book 1','mickey mouse'),
    (2,'test book 2','mickey mouse'),
    (3,'test book 3','mickey mouse');
INSERT INTO contacts (id,"name",phone,address_book_id) VALUES
    (1,'hello kitty','1234567890',1),
    (2,'hello kitty','1234567890',1),
    (3,'hello kitty','1234567890',2),
    (4,'donald duck','1234567890',2);