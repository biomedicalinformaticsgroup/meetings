library(dplyr)
library(magrittr)
library(ggplot2)

### R pipes (the %>% operator etc.) come from the "magrittr" package, whose name is a terrible pun...
### For more info, see https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html

df <- data.frame(a=rnorm(10), b=rnorm(10), c=rnorm(10))

### 1. Basic piping

# Instead of...

df <- mutate(df, total=a+b+c)
pull(df, total)

# or...

pull(mutate(df, total=a+b+c), total)

# we can do...

df %>% 
  mutate(total=a+b+c) %>% 
  pull(total)

# Essentially, "f(x)" == "x %>% f"

### 2. Assignment

# To reassign the results back to df, in normal R:

df <- mutate(df, total=a+b+c)

# With the pipe you could do this:

df <- df %>% mutate(total=a+b+c)

# But a shortcut is to use the "%<>%" operator:

df %<>% mutate(total=a+b+c)

### 3. Placeholders

# The placeholder (".") can be used in a pipe when you want to 
# use the LHS in a place other than the first argument:

lm(a~b, data=df)

df %>% lm(a~b, data=.)

# The placeholder can be used multiple times

cbind(df, df)

df %>% cbind(., .)

# Unfortunately, things don't quite work if the placeholder occurs 
# only in "nested" expressions:

cor(df$a, df$b)

df %>% cor(.$a, .$b)  # doesn't work

# In this case, a workaround is to surround the RHS in curly brackets:

df %>% { cor(.$a, .$b) }

### 4. Unary functions

# Pipes can be used to define "on-the-fly" unary functions:

df_head <- head(df, 1)
df_tail <- tail(df, 1)
rbind(df_head, df_tail)

df %>% {
  head <- head(., 1)
  tail <- tail(., 1)
  rbind(head, tail)
}

# You can also use the placeholder and pipes to define re-usable 
# unary functions:

get_first <- . %>% head(1)

df %>% get_first()

### 5. Tee operations

# What if you want to print out what's happening midway through a 
# set of pipes? In fact, "print" silently returns its input, so 
# you can just insert it into pipes:

df %>% 
  mutate(total=a+b+c) %>% 
  { plot(.$a, .$total) }
  
df %>% 
  mutate(total=a+b+c) %>% 
  print %>% 
  { plot(.$a, .$total) }

# And indeed, you can make any function behave this way by using 
# the tee operator ("%T>%"):

df %>% 
  mutate(total=a+b+c) %>% 
  { plot(.$a, .$total) } %>% 
  colSums # doesn't work

df %>% 
  mutate(total=a+b+c) %T>% 
  { plot(.$a, .$total) } %>% 
  colSums

### 6. Exposition of variables 

# Some functions, like "lm" expose the names (e.g. column names) of their data:

df %>% lm(a~b, data=.)

# You can also do this for any function with pipes, with the handily-named 
# "pipe with exposition of variables" operator ("%$%"). This allows a nicer 
# solution to the problem above where we had to use curly braces:

cor(df$a, df$b)

df %>% { cor(.$a, .$b) }

df %$% cor(a, b)

### And finally, unrelated to pipes - I didn't know that you can create 
### named View windows in RStudio...

df <- data.frame(a=rnorm(10), b=rnorm(10), c=rnorm(10))

df %>% View

df %<>% mutate(total=a+b+c)

df %>% View # overwrites original data!

df <- data.frame(a=rnorm(10), b=rnorm(10), c=rnorm(10))

df %>% View("original")

df %<>% mutate(total=a+b+c)

df %>% View("mutated")
