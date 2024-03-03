set foreign_key_checks = 0;

/***********************************************************
	      creating the tables for Recipes
  *******************************************************/  
-- table 01
CREATE TABLE Recipe_Classes (
	RecipeClassID int NOT NULL,
	RecipeClassDescription nvarchar (256) NOT NULL
    );

-- table 02
CREATE TABLE Recipes (
	RecipeID int NOT NULL,
	RecipeTitle nvarchar (256) NOT NULL,
	RecipeClassID int NOT NULL,
	Preparation nvarchar (256) NOT NULL,
	Notes nvarchar (256) NULL
    );

-- table 03
CREATE TABLE Ingredient_Classes (
	IngredientClassID int NOT NULL,
	IngredientClassDescription nvarchar (256) NOT NULL
    );

-- table 04
CREATE TABLE Ingredients (
	IngredientID int NOT NULL,
	IngredientName nvarchar (256) NOT NULL,
	IngredientClassID int NOT NULL,
    MeasureAmountID int NOT NULL 
    );

-- table 05
CREATE TABLE Recipe_Ingredients (
	RecipeID int NOT NULL,
	RecipeSeqNo int NOT NULL,
	IngredientID nvarchar (50) NULL,
    MeasureAmountID int NOT NULL,
    Amount int NOT NULL
    );

-- table 06
CREATE TABLE Measurements (
	MeasureAmountID int NOT NULL,
	MeasurementDiscription nvarchar (256) NOT NULL
    );

select * from Recipe_Classes;
select * from Recipes;
select * from Ingredient_Classes;
select * from Ingredients;
select * from Recipe_Ingredients;
select * from Measurements;

/*******Primary Keys*******/
-- table 01 ========> Recipe_Classes
  ALTER TABLE Recipe_Classes
   ADD CONSTRAINT Recipe_Classes_PK PRIMARY KEY(RecipeClassID);

-- table 02 ========> Recipes
  ALTER TABLE Recipes
   ADD CONSTRAINT Recipes_PK PRIMARY KEY(RecipeID);

-- table 03 ========> Ingredient_Classes
  ALTER TABLE Ingredient_Classes
   ADD CONSTRAINT Ingredient_Classes_PK PRIMARY KEY(IngredientClassID);

-- table 04 ========> Ingredients
  ALTER TABLE Ingredients
   ADD CONSTRAINT Ingredients_PK PRIMARY KEY(IngredientID);

-- table 05 ========> Recipe_Ingredients
  ALTER TABLE Recipe_Ingredients
   ADD CONSTRAINT Recipe_Ingredients_PK PRIMARY KEY(RecipeID,RecipeSeqNo);

-- table 06 ========> Measurements
  ALTER TABLE Measurements
   ADD CONSTRAINT Measurements_PK PRIMARY KEY(MeasureAmountID);
   
 
 /*******Foreign Keys*******/
  ALTER TABLE Recipes
   ADD CONSTRAINT Recipes_FK00 FOREIGN KEY(RecipeClassID) REFERENCES Recipe_Classes(RecipeClassID);

  ALTER TABLE Ingredients
   ADD CONSTRAINT Ingredients_FK00 FOREIGN KEY(IngredientClassID) REFERENCES Ingredient_Classes(IngredientClassID);
   
  ALTER TABLE Recipe_Ingredients
   ADD CONSTRAINT Recipe_Ingredients_FK00 FOREIGN KEY(RecipeID) REFERENCES Recipes(RecipeID);
   
   ALTER TABLE Recipe_Ingredients
   ADD CONSTRAINT RecipeSeqNo_FK00 FOREIGN KEY(MeasureAmountID) REFERENCES Measurements(MeasureAmountID);
   
   ALTER TABLE Ingredients
   ADD CONSTRAINT IngredientID_FK00 FOREIGN KEY(MeasureAmountID) REFERENCES Measurements(MeasureAmountID);
   
  ALTER TABLE Recipe_Ingredients
   ADD CONSTRAINT RecipeID_FK00 FOREIGN KEY(MeasureAmountID) REFERENCES Ingredients(MeasureAmountID);
   
   insert into Recipe_Classes(RecipeClassID, RecipeClassDescription)
   values
   (01, "Spaghetti"),
   (02, "Pizza"),
   (03, "Hamburger"),
   (04, "chicken"),
   (05, "breadsticks"),
   (06, "cake"),
   (07, "donughts"),
   (08, "pie"),
   (09, "cookies"),
   (10, "steak"),
   (11, "tacos"),
   (12, "burrito"),
   (13, "eggs"),
   (14, "fries"),
   (15, "soup");
   
   insert into Recipes(RecipeID,RecipeTitle,RecipeClassID,Preparation,Notes)
   values
   (01,"Spaghetti and meatballs",01,"boil water","italian dish"),
   (02,"Pepperoni Pizza",02,"roll dough","italian dish"),
   (03,"Bacon cheeseburger",03,"make bacon","American dish"),
   (04,"Chicken and broccoli",04,"season chicken","American dish"),
   (05,"breadsticks",05,"make dough","italian dish"),
   (06,"cake",06,"make icing","dessert"),
   (07,"doughnuts",07,"make filling","dessert"),
   (08,"pie",08,"make choclate chips","dessert"),
   (09,"cookies",09,"make shells and brown meat","mexican dish"),
   (10,"steak",10,"make tortillas","mexican dish"),
   (11,"tacos",11,"make shells","mexican dish"),
   (12,"burritos",12,"make tortillas","mexican dish"),
   (13,"eggs",13,"heat oil","british dish"),
   (14,"fries",14,"heat oil","American dish"),
   (15,"soup",15,"make broth","Italian dish");
   
   insert into Ingredient_Classes(IngredientClassID,IngredientClassDescription)
   values
   (01,"sauce and noodles"),
   (02,"pepperoni and sauce"),
   (03,"buns and bacon"),
   (04,"brocoli and seasoning"),
   (05,"butter and flour"),
   (06,"sugar and eggs"),
   (07,"flour and oil"),
   (08,"pie crust and fruits"),
   (09,"cookie dough"),
   (10,"seasoning"),
   (11,"corn tortillas and lettuce"),
   (12,"beans"),
   (13,"eggs"),
   (14,"potatoes"),
   (15,"chicken");
   
   insert into Ingredients(IngredientID,IngredientName,IngredientClassID,MeasureAmountID)
   values
   (01,"Salt and pepper",01,1),
   (02,"salt",02,2),
   (03,"pepper",03,1),
   (04,"paprika",04,2),
   (05,"flour",05,1),
   (06,"flour",06,4),
   (07,"flour",07,5),
   (08,"beef",08,7),
   (09,"salt",09,9),
   (10,"steak",10,8),
   (11,"corn tortillas",11,22),
   (12,"beans",12,3),
   (13,"eggs",13,2),
   (14,"potatoes",14,3),
   (15,"chicken",15,5);
   
   insert into Recipe_Ingredients(RecipeID,RecipeSeqNo,IngredientID,MeasureAmountID,Amount)
   values
   (01,01,"01",01,1),
   (02,02,"02",02,2),
   (03,03,"03",03,3),
   (04,04,"04",04,1),
   (05,05,"05",05,1),
   (06,06,"06",06,1),
   (07,07,"07",07,1),
   (08,08,"08",08,1),
   (09,09,"09",09,1),
   (10,10,"10",10,1),
   (11,11,"11",11,1),
   (12,12,"12",12,1),
   (13,13,"13",13,1),
   (14,14,"14",14,1),
   (15,14,"14",14,1);
   
   insert into Measurements(MeasureAmountID,MeasurementDiscription)
   values
   (01,"Dont put to much"),
   (02,"Dont put to little"),
   (03,"Dont put to much"),
   (04,"Dont put to little"),
   (05,"Dont put to much"),
   (06,"Dont put to little"),
   (07,"Dont put to little"),
   (08,"Dont put to little"),
   (09,"Dont put to little"),
   (10,"Dont put to little"),
   (11,"Dont put to much"),
   (12,"Dont put to much"),
   (13,"Dont put to little"),
   (14,"Dont put to much"),
   (15,"Dont put to little");
   
   select * from Recipe_Classes;
   select * from Recipes;
   select * from Ingredient_Classes;
   select * from Ingredients;
   select * from Recipe_Ingredients;
   select * from Measurements;
   