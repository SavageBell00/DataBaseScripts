# noinspection SqlCurrentSchemaInspection

CREATE DATABASE HomeLibraryDB;
DROP DATABASE HomeLibraryDB;
USE homelibrarydb;

CREATE OR REPLACE TABLE Author (
    AuthorID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(60) NOT NULL ,
    LastName varchar(60) NOT NULL,
    PRIMARY KEY (AuthorID)
);

CREATE OR REPLACE TABLE Publisher (
    PublisherID int NOT NULL AUTO_INCREMENT,
    PublishingName varchar(60) NOT NULL,
    PRIMARY KEY (PublisherID)
);

CREATE OR REPLACE TABLE Genre (
    GenreID int NOT NULL AUTO_INCREMENT,
    Genre varchar(30) NOT NULL,
    PRIMARY KEY (GenreID)
);

CREATE OR REPLACE TABLE Book (
    BookID int NOT NULL AUTO_INCREMENT ,
    Title varchar(70) NOT NULL ,
    YearPublished varchar(4),
    ISBN varchar(40),
    PublisherID int NOT NULL,
    CONSTRAINT FOREIGN KEY (PublisherID) REFERENCES Publisher (PublisherID),
    GenreID int NOT NULL,
    CONSTRAINT FOREIGN KEY (GenreID) REFERENCES Genre (GenreID),
    AuthorID int NOT NULL,
    CONSTRAINT FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID),
    PRIMARY KEY (BookID)
);
CREATE OR REPLACE TABLE Library (
    LibID int NOT NULL AUTO_INCREMENT,
    InStock BOOLEAN NOT NULL ,
    DateIn DATE,
    DateOut DATE,
    AuthorID int NOT NULL,
    CONSTRAINT FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID),
    BookID int NOT NULL,
    CONSTRAINT FOREIGN KEY (BookID) REFERENCES Book (BookID),
    GenreID int NOT NULL,
    CONSTRAINT FOREIGN KEY (GenreID) REFERENCES Genre (GenreID),
    PublisherID int NOT NULL,
    CONSTRAINT FOREIGN KEY (PublisherID) REFERENCES Publisher (PublisherID),
    PRIMARY KEY (LibID)
);

-- inserting rows into Genre

INSERT INTO Genre (Genre)
VALUES
    ('Fantasy'),
    ('Science Fiction'),
    ('Dystopian'),
    ('Action & Adventure'),
    ('Mystery'),
    ('Horror'),
    ('Thriller & Suspense'),
    ('Historical Fiction'),
    ('Romance'),
    ('Graphic Novel'),
    ('Short Story'),
    ('Young Adult'),
    ('Childrens'),
    ('Memory & Autobiography'),
    ('Biography'),
    ('Food & Drink'),
    ('Art & Photography'),
    ('Self-help'),
    ('History'),
    ('Travel'),
    ('True Crime'),
    ('Humor'),
    ('Essays'),
    ('Guide/ How-to'),
    ('Religion & Spirituality'),
    ('Humanities & Social Sciences'),
    ('Parenting & Families'),
    ('Science & Technology'),
    ('Programming'),
    ('Poetry'),
    ('Magazine'),
    ('Health & Medicine'),
    ('Textbook'),
    ('Chinese Medicine'),
    ('Chinese Philosophy')
;

# ALTER TABLE Genre RENAME COLUMN Coding TO Programming;


