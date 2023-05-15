BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Organizers" (
	"OrganizerID"	INTEGER,
	"Name"	TEXT,
	"Email"	TEXT,
	"Phone"	INTEGER,
	PRIMARY KEY("OrganizerID")
);
CREATE TABLE IF NOT EXISTS "Users" (
	"UserID"	INTEGER,
	"FirstName"	TEXT,
	"LastName"	INTEGER,
	"Email"	TEXT,
	"Phone"	TEXT,
	PRIMARY KEY("UserID")
);
CREATE TABLE IF NOT EXISTS "Venue" (
	"VenueID"	INTEGER,
	"Address"	TEXT,
	"Capacity"	INTEGER,
	PRIMARY KEY("VenueID")
);
CREATE TABLE IF NOT EXISTS "Events" (
	"EventID"	INTEGER,
	"Name"	TEXT,
	"Date"	INTEGER,
	"Time"	INTEGER,
	"Type"	TEXT,
	"Number_Of_Tickets"	INTEGER,
	"Description"	TEXT,
	"VenueID"	INTEGER,
	"OrganizerID"	INTEGER,
	PRIMARY KEY("EventID"),
	FOREIGN KEY("VenueID") REFERENCES "Venue"("VenueID"),
	FOREIGN KEY("OrganizerID") REFERENCES "Organizers"("OrganizerID")
);
CREATE TABLE IF NOT EXISTS "Tickets" (
	"TicketID"	INTEGER,
	"EventID"	INTEGER,
	"TicketType"	TEXT,
	"Price"	INTEGER,
	"Section"	INTEGER,
	"Purchased"	INTEGER,
	PRIMARY KEY("TicketID"),
	FOREIGN KEY("EventID") REFERENCES "Events"
);
CREATE TABLE IF NOT EXISTS "Inventory" (
	"InventoryID"	INTEGER,
	"TicketID"	INTEGER,
	"UserID"	INTEGER,
	PRIMARY KEY("InventoryID"),
	FOREIGN KEY("TicketID") REFERENCES "Tickets"("TicketID"),
	FOREIGN KEY("UserID") REFERENCES "Users"("UserID")
);
CREATE TABLE IF NOT EXISTS "Orders" (
	"OrderID"	INTEGER,
	"UserID"	INTEGER,
	"TotalAmount"	REAL,
	"Payment"	TEXT,
	"Date"	INTEGER,
	"EventID"	INTEGER,
	PRIMARY KEY("OrderID"),
	FOREIGN KEY("UserID") REFERENCES "Users"("UserID")
);
CREATE TABLE IF NOT EXISTS "OrderListItem" (
	"OrderListItemID"	INTEGER,
	"OrderID"	INTEGER,
	"TicketID"	INTEGER,
	PRIMARY KEY("OrderListItemID"),
	FOREIGN KEY("OrderID") REFERENCES "Orders"("OrderID"),
	FOREIGN KEY("TicketID") REFERENCES "Tickets"("TicketID")
);
COMMIT;
