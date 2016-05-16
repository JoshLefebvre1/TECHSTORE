CREATE TABLE CATEGORY
(
	CategoryId 		INT 			IDENTITY 	PRIMARY KEY,
	Name		 	VARCHAR(255)	NOT NULL
)

CREATE TABLE PRODUCT
(
	ProductId			int	 			identity	primary key,
	CategoryId	 		int	 			not null,
	Name 				varchar(255)	not null,
	ShortDescription	varchar(512) 	not null,
	LongDescription 	varchar(MAX)  	not null,
	Price 				float			not null,
	SalePrice 			float 			not null,
	IsOnSale 			bit 			not null,
	ImageName 			varchar(255) 	not null
	CONSTRAINT  		FK_CategoryID	FOREIGN KEY(CategoryID)		REFERENCES Category(CategoryID)
)

CREATE TABLE Bad_Words
(
	WordID			INT				NOT NULL IDENTITY (1,1),
	Word			VARCHAR(50)		NOT NULL,
	CONSTRAINT		PK_WordID		PRIMARY KEY (WordID)
)

CREATE TABLE User_Reviews
(
	ReviewID		INT					NOT NULL IDENTITY(1,1),
	Name 			VARCHAR(50)			NOT NULL,
	UserReview 		VARCHAR(512)		NOT NULL,
	Stars			INT					NOT NULL,
	ProductID		INT					NOT NULL,
	UserID			INT					NOT NULL,
	CONSTRAINT		PK_Review			PRIMARY KEY (ReviewID),
	CONSTRAINT		FK_ProductID		FOREIGN KEY (ProductID)		REFERENCES PRODUCT(ProductId),
	CONSTRAINT		FK_UserID2			FOREIGN KEY (UserID)	REFERENCES Users(UserID)
);

CREATE TABLE Users
(
	UserID			INT 			NOT NULL IDENTITY(1,1),	
	Email			VARCHAR(50)		NOT NULL,
	Password 		VARCHAR(50) 	NOT NULL,
	IsAdmin 		INT 			NOT NULL 	DEFAULT 0,
	CONSTRAINT		PK_UserID		PRIMARY KEY (UserID)
)