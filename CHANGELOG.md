Do this to generate your change history

  git log --pretty=format:'  * %h - %s (%an, %ad)' vX.Y.Z..HEAD

### 1.0.1 (23 July 2015)

* 026f6b2 - Added minitest as runtime dependency (Beth Skurrie, Thu Jul 23 12:04:12 2015 +1000)
* e6613a3 - Added test to ensure RSpec is not loaded (Beth Skurrie, Sun Jul 19 08:10:38 2015 +1000)

### 1.0.0 (25 May 2015)

* 6222f4e - Explicitly specify dependency on minitest > 5.0.0 (David Heath, Wed May 20 18:48:23 2015 +0100)
