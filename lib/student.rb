require_relative "../config/environment.rb"

class Student
  attr_accessor :name, :grade
  attr_reader :id 
   def initialize (id=nil, name, grade)
      @id = id 
      @name = name 
      @grade = grade 
   end 

def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end

def self.drop_table
    sql =  "DROP TABLE students"
    DB[:conn].execute(sql)
  end

def save 
  if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO students (name, grade) 
        VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
end 
end 
  
  def self.create(name:, grade:)
    song = Song.new(name,grade)
    song.save
    song 
  end 
  
  def self.find_by_name(name)
    sql = "SELECT * FROM students WHERE name = ?"
    result = DB[:conn].execute(sql, name)
    new_from_db(result[0])
  end

  def update
    sql = "UPDATE students SET name = ?, grade = ? WHERE name = ?"
      DB[:conn].execute(sql, self.name, self.grade, self.id)
    end 
  
  def save 
    sql = <<-SQL 
     INSERT INTO songs (name, album)
     VALUES (?, ?)
  SQL
  DB[:conn].execute(sql, self.name, self.grade)
  @id = DB[:conn].execute("SELECT last_insert_rowid() FROM grade" [0][0])
end
  
end 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  