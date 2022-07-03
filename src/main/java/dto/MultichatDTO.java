package dto;

public class MultichatDTO {

   private int seq;
   private String writer;
   private String contents;
   private String sysName;
   
   public MultichatDTO() {
      
   }

   public MultichatDTO(int seq, String writer, String contents, String sysName) {
      this.seq = seq;
      this.writer = writer;
      this.contents = contents;
      this.sysName = sysName;
   }

   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public String getContents() {
      return contents;
   }

   public void setContents(String contents) {
      this.contents = contents;
   }

   public String getSysName() {
      return sysName;
   }

   public void setSysName(String sysName) {
      this.sysName = sysName;
   }
   
   
}