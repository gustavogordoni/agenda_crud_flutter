package br.com.aula.rest_api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;

import br.com.aula.rest_api.database.RepositoryContact;
import br.com.aula.rest_api.entity.Contact;

@RestController
@RequestMapping("/contact")
public class ContactREST {
    @Autowired
    private RepositoryContact repository;

    // Operações CRUD disponíveis na REST API

    @GetMapping
    public List<Contact> list() {
        return repository.findAll();
    }

    @PostMapping
    public void save(@RequestBody Contact contact) {
        repository.save(contact);
    }

    @PutMapping
    public void update(@RequestBody Contact contact) {
        if(contact.getId() > 0){
            repository.save(contact);
        }   
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        repository.deleteById(id);
    }
    
}
