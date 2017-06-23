for ($i=1;$i -le 18;$i++){ (New-Object Net.WebClient).DownloadFile('https://d396qusza40orc.cloudfront.net/ml/docs/slides/Lecture'+$i+'.pdf', 'C:\Lectures\Lecture_'+$i+'.pdf')}
