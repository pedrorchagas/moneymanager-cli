require 'sqlite3'

db = SQLite3::Database.new "depositos.db"

db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS registros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT DEFAULT CURRENT_TIMESTAMP,
    valor_total REAL NOT NULL,
    dizimo REAL NOT NULL,
    investimento REAL NOT NULL,
    restante REAL NOT NULL
  );
SQL

# manipular as opções
@options = {}
ARGV.each do | option |
  case
  when option == "-h" || option == '--help'
    @options[:help] = true
  when option == "-a" || option == '--add'
    @options[:add] = true
  when option == '-c' || option == '--config'
    @option[:config] = true
  end
end

if @options[:help] == true
  puts 'ajuda elee ai!'
end

if @options[:add] == true
  ARGV.clear
  puts 'Escreva o valor a ser adicionado'
  value = gets.strip.to_f
  
  db.execute("INSERT INTO registros (valor_total, dizimo, investimento, restante) VALUES (?, ?, ?, ?)", [valor_total, dizimo, investimento, restante])
end
