final createTable = '''
  CREATE TABLE contact (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(200) NOT NULL,
    telefone CHAR(16) NOT NULL,
    email VARCHAR(150) NOT NULL,
    url_avatar VARCHAR(300) NOT NULL
  );
''';

final insertValues = '''
  INSERT INTO contact (nome, telefone, email, url_avatar) VALUES 
    ('Pietro', '(19) 9 9874-6565', 'pietro@email.com', 'https://www.w3schools.com/howto/img_avatar.png'),
    ('Maria', '(11) 9 9813-1565', 'maria@email.com', 'https://www.w3schools.com/howto/img_avatar.png'),
    ('João', '(17) 9 9889-5654', 'joao@email.com', 'https://www.w3schools.com/howto/img_avatar.png'),
    ('Pedro', '(11) 9 9883-5256', '@pedro@email.com', 'https://www.w3schools.com/howto/img_avatar.png'),
    ('Paulo', '(11) 9 9579-1566', 'paulo@email.com', 'https://www.w3schools.com/howto/img_avatar.png'),
    ('Joana', '(17) 9 9843-5731', 'joana@email.com', 'https://www.w3schools.com/howto/img_avatar.png');
''';
