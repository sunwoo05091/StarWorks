package org.starworks.domain;

import lombok.Data;

@Data
public class DocumentAttachVO {

  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;
  
  private Long bno;
  private Long dc_no;
  
}
