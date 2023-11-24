package site.metacoding.yellow.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity
public class Board {
    // Id : 컬럼을 기본 키(PK)로 지정하는 역할
    @Id
    // GeneratedValue : Auto Increment, 자동으로 1씩 증가 strategy : 고유 번호를 생성하는 옵션
    // GenerationType.IDENTITY : 독립적인 시퀀스를 생성, 기본 키 생성을 위한 설정
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // @Column 컬럼의 세부 설정을 정의 할 때 사용 length : 컬럼의 길이를 설정 columnDefinition = "TEXT" :
    // 글자 수를 제한 할 수 없는 경우에 사용
    @Column(length = 200)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String content;

    private LocalDateTime createDate;
}
