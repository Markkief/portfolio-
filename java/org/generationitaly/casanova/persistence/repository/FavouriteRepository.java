package org.generationitaly.casanova.persistence.repository;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.Favourite;

public interface FavouriteRepository extends JpaRepository<Favourite, Integer>{
    public List<Favourite> findAllByUser(Long id);
}
