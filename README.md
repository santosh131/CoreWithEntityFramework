# EntityFramework
It is an object/relational mapping framework. EF core supports two development appraoches
a) Code- First (Domain driven design)
b) Database -First 

CF core uses provider model to access many different databases. EF Core includes providers such as Nuget pacakges which we need to install  

DB: **Sql Server**  
Nuget: **Microsoft.EntityFrameworkCore.SqlServer**  

Domain Class: Includes core functionality & business rules of application  
Entities: Are mapped to corresponding tables in database  

To treat the domain classes as entities we need to include them as DbSet<T> properties in DBContext class.  

# Migrations
EF core migrations are a set of commands which can be executed in **package manager console** or .**Net core CLI**  

Nuget: **Microsot.EntityframeworkCore.Tools**  

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


# Reference Navigation  
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

