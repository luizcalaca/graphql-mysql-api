const dbConfig = require('../utils/dbConfig');
const mysql = require('mysql2/promise');

// Resolvers das queries do GraphQL
const resolvers = {
    Query: {
      autores: async () => {
        try {
          const connection = await mysql.createConnection(dbConfig);
          const [rows] = await connection.query(
            'SELECT a.id, a.nome, b.id AS livro_id, b.titulo, b.ano_publicacao FROM autores a INNER JOIN autores_livros al ON a.id = al.autor_id INNER JOIN livros b ON al.livro_id = b.id'
          );
          connection.end();
  
          const authorsMap = new Map();
          rows.forEach((row) => {
            const { id, nome, livro_id, titulo, ano_publicacao } = row;
  
            if (!authorsMap.has(id)) {
              authorsMap.set(id, {
                id,
                nome: nome,
                livros: [],
              });
            }
  
            const author = authorsMap.get(id);
            author.livros.push({
              id: livro_id,
              titulo: titulo,
              ano_publicacao: ano_publicacao,
            });
          });
  
          const authors = Array.from(authorsMap.values());
          return authors;
        } catch (error) {
          console.error('Error querying authors:', error);
          console.log('CONEXÃO', connection);
          throw new Error('Failed to fetch authors');
        }
      },
    },
  };

module.exports = resolvers;