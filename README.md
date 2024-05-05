# EntityFramework
It is an object/relational mapping framework. EF core supports two development approaches
a) Code- First (Domain driven design)
b) Database -First 

EF core uses provider model to access many different databases. EF Core includes providers such as Nuget pacakges which we need to install  

DB: **Sql Server**  
Nuget:   
**Microsoft.EntityFrameworkCore**  
**Microsoft.EntityFrameworkCore.SqlServer**  

Domain Class: Includes core functionality & business rules of application  
Entities: Are mapped to corresponding tables in database  

To treat the domain classes as entities we need to include them as DbSet<T> properties in DBContext class.  
# Steps  
> 1. Create Domain classes  
- By default, entity framework core maps POCO classes to tables using a set of conventions, it can be overridden by DataAnnotations or FluenApi.    
> 2. Create DBcontext class 
- Constructor **(DbContextOptions options) : base(options)**  
- If needed implement **OnModelCreating(ModelBuilder modelBuilder)** - for FluentApi  
- Create Entities **Properties with DbSet**  
> 3. Update **Program.cs**  
```
.Services.AddDbContext<EmployeeContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("myconnectionstring"));
});
```  
> 4. After enabling the migrations, run the commands mentioned below  

# Migrations
EF core migrations are a set of commands which can be executed in **package manager console** or .**Net core CLI**  

Nuget: **Microsot.EntityframeworkCore.Tools**  
> Run **Enable-Migrations** command in the Package Manger console to enable migrations for the context

| Package Manager Console 	| .Net Core CLI                    	|
|-------------------------	|----------------------------------	|
| add-migration name      	| dotnet ef migration add name     	|
| update-database         	| dotnet ef database update        	|
| update-database "name"  	| dotnet ef database update "name" 	|
| remove-migration        	| dotnet ef migrations remove      	|
| Get-Migration           	| dotnet ef migrations list        	|
  
## Generate scripts for deployment  
| Package Manager Console 	| .Net Core CLI                    	|
|-------------------------	|----------------------------------	|
| Script-Migration        	| dotnet ef migrations script      	|  

|-------------------------------------------------------------- |  
# Navigation  
Navigations comes in  two forms
## Reference  
## Collection  

### Reference Navigation  
Simple object references to another entity. They represent "One" side of **one-to-one** & **one to many** relationships.  
- They should have setter & should not be assigned a non-null default.
- They must be nullable for optional relationships
```
 public Blog? Blog { get; set; }
```
A property of an entity type is discovered as reference nvaigation when Property
- is public
- has getter and setter
- is not Static
- must not be mapped as primitive property (int, string...)
```
public class Blog {  

 public int Id { get; set; } //Not Reference navigation  

 public Author? Author { get; set; } //Reference navigation
}

public class Author {  

 public int Id { get; set; } //Not Reference  

 public Blog? Blog { get; set; } //Reference navigation  
}
```

### Collection Navigation
A property of an entity type is discovered as collection navigation when property
-  is public
- has getter and setter
- type implements IEnumerable<TEntity>  
    **TEntity**
    - Must be reference type
    - must not be mapped as primitve property
    - must not be Static  
```
public class Blog {  

 public int Id { get; set; }

 public List<Tag> Tags { get; set; } = null; //Collection navigation
}

public class Tag {  

 public Guid Id { get; set; }

 public IEnumerable<Blog> Blogs { get; set; } =new List<Blog>(); //Collection navigation  
}
```  

# Configuring Domain Classes
- DataAnnotation Attributes
- FluentApi

>EntityFramework uses the Code First naming conventions to map classes to database. If the conventions are not followed while defining the classes Fluent Api or Data annotations can be used to configure the classes.  

## DataAnnotation Attributes  

- **Key** annotation is used to specify that property is EntityKey(primary key)
- **Required** annotation is used to specify that property is required. With no additional code or markup change  
 in application an MVC application will perform client side application building a message in property and annotation names.
- **MaxLength, MinLength** annotation is similar to **Required** annotation, builds error message dynamically. These specify how many chars are allowed/stored in database.
- **StringLength** annotation is similar to MaxLength, it specififes how chars are allowed in data field.
- **NotMapped** annotation is used to specify that property is not mapped to database.
- **Table** annotation is used to map the table name to the class  
- **Column** annotation is used to map the column name to the property 
- **Index** annotation is used to create the index on the column in database  

```
 [Table("employees")]  
 public class EmployeeModel  
 {  
    [Key]  
    [Column("employee_id")]  
    public int? EmployeeId { get; set; }  

    [Column("first_name", TypeName = "ntext")]  
    [Required(AllowEmptyStrings = false, ErrorMessage = "Please enter First Name")] 
    [MaxLength(30, ErrorMessage = "First Name can have maximum of 30 chars")]
    [MinLength(5, ErrorMessage = "First Name should have minimum 5 chars")]     
    public string FirstName { get; set; }  
    
    [Column("last_name")]  
    [AllowNull]  
    [StringLength(50, ErrorMessage = "50 chars are allowed" )]  
    public string? LastName { get; set; }  

    [NotMapped]
    public string FullName { 
        get  {
            return LastName + ", " +  FirstName;
        }
    }
 }  
```
### Data Annotations - Foreign Key  
 
## FluentApi  
  
> Foreign Key properties can be configured by using HasFoerignKey method which takes lambda expression that represents the property to be used as properties.

| Method          	| Usage                                                         	|
|-----------------	|---------------------------------------------------------------	|
| HasKey          	| Property as Primary Key                                       	|
| HasForeignKey   	| Property as Foreign Key                                       	|
| HasColumnName   	| Configures database column name of the property               	|
| HasColumnType   	| Configures database column type of the property               	|
| HasDefaultValue 	| default value for a database column mapped to a property      	|
| HasOne          	| Represents one side of one to many or one to one relationship 	|
| WithMany        	| Represents many side of one to many relationship              	|
| HasMany         	| Represents many side of one to many relationship              	|
| WithOne         	| Represents one side one to many or one to one relationship    	|

> Consider the following domain classes  

```
// Principal (parent)  
public class Blog  
{  
    public int Id { get; set; }  
    public BlogHeader? Header { get; set; } // Reference navigation to dependent  
}  
  
// Dependent (child)
public class BlogHeader  
{  
    public int Id { get; set; }  
    public int BlogId { get; set; } // Required foreign key property  
    public Blog Blog { get; set; } = null!; // Required reference navigation to principal  
}  
```

```
public class Author{  
    public int AuthorId { get; set;}    //Primary Key  
    public string Name { get; set;}  
    public List<Book>? Books { get; set;} //Navigation Property , Collection Navigation
}  
  
public class Book{  
    public int BookId { get; set;}    //Primary Key  
    public string Name { get; set;}  
    public int BookId { get; set;}    //Foreign Key  
    public Author? Author { get; set;} //Navigation Property , Reference Navigation  
}  
```

```
public class Post
{
    public int Id { get; set; }
    public List<Tag> Tags { get; } = [];
    public List<PostTag> PostTags { get; } = [];
}

public class Tag
{
    public int Id { get; set; }
    public List<Post> Posts { get; } = [];
    public List<PostTag> PostTags { get; } = [];
}

public class PostTag
{
    public int PostId { get; set; }
    public int TagId { get; set; }
}
```

### One to One  
- Configuring Parent to Child - HasOne/Withone pattern
```
 .HasOne(a => a.Header)
 .WithOne(b => b.Blog)
 .HasForeignKey<BlogHeader>(b => b.BlogId)
```
- Configuring Child to Parent - HasOne/Withone pattern
```
 .HasOne(b => b.Blog)
 .WithOne(a => a.Header)
 .HasForeignKey<BlogHeader>(b => b.BlogId)
```
  
### One to Many  
- Configuring Parent to Child  - HasMany/WithOne pattern
```
 .HasMany(a => a.Books) // Author has many Books
 .WithOne(b => b.Author) //Book is associated with one Author
 .HasForeignKey(b => b.AuthorId) //AuthorId is ForeignKey in Books
```
  
- Configuring Child to Parent  - HasOne/WithMany pattern
```
 .HasOne(a => a.Author) //Book is associated with one Author
 .WithMany(b => b.Books) // Author has many Books
 .HasForeignKey(b => b.AuthorId) //AuthorId is ForeignKey in Books
```

### Many to Many  
```
.HasMany(t => t.Tags)
.WithMany(p => p.Posts)
.UsingEntity("JoiningTableName");
//.UsingEntity<PostTag>();
```


