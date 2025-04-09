package br.com.aula.rest_api.database;

import org.springframework.data.jpa.repository.JpaRepository;
import br.com.aula.rest_api.entity.Contact;

public interface RepositoryContact extends JpaRepository<Contact,Long> {
       
}
