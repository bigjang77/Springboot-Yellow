package site.metacoding.yellow.domain;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<Board, Integer> {

    Optional<Board> findById(Integer id);

    Board findByContent(String content);

    Board save(Board board);
}