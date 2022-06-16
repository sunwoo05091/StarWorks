package org.starworks.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {

  private int pageNum;
  private int amount;
  
  private String type; //TCW => {T,C,W}
  private String keyword;

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
  public String[] getTypeArr() { //sql문에서 호출됨
    
    return type == null? new String[] {}: type.split(""); //문자로 나눠서 배열로 만들어준다
  }
  
  public String getListLink() {
	  //UriComponentsBuilder 는 브라우저에서 GET 방식등의 파라미터 전송에 사용되는 문자열(쿼리스트링)을 손쉽게 처리할 수 있는 클래스.
	  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			  .queryParam("pageNum", this.pageNum)
			  .queryParam("amount", this.getAmount())
			  .queryParam("type", this.getType())
			  .queryParam("keyword", this.getKeyword());
	  
	  return builder.toUriString();
  }
}
