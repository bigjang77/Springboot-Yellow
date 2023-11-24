package site.metacoding.yellow.domain;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<Board, Integer> {

    Board findBySubject(String subject);

    Board findByContent(String content);
}