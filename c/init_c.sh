# Sets up a barebones C project with makefile

read -e -p "C project path: " PROJECT_PATH

[ ! -d "$PROJECT_PATH" ] && mkdir -pv $PROJECT_PATH

mkdir -pv $PROJECT_PATH/build/
mkdir -pv $PROJECT_PATH/incs/utils
mkdir -pv $PROJECT_PATH/srcs/utils

cat  << "EOF" > "$PROJECT_PATH/Makefile"
NAME = helloworld
C = gcc -fsanitize=address -g3
INCS_ROOT = incs/
INCS_UTILS = incs/utils
BUILDDIR=build/
C_INCS= -I${INCS_ROOT} -I${INCS_UTILS}
C_FLAGS = -Wall -Wextra
SRCS = ${wildcard srcs/*.c srcs/utils/*.c}
OBJS= ${SRCS:.c=.o}
OBJS_TARGET=${addprefix ${BUILDDIR},${subst /,_,${OBJS}}}

# Style constants
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[0;33m
BLUE=\033[0;34m
PURPLE=\033[0;35m
CYAN=\033[0;36m
NC=\033[0m # No Color

all : ${NAME}
	@echo "${GREEN}✔️  Done building..${NC}"

bonus : ${NAME}

${NAME}: ${OBJS_TARGET}
	@echo "${GREEN}😏  Linking..${NC}"
	@${C} ${BUILDDIR}*.o ${C_FLAGS} -o ${NAME}

build/%.o : ${OBJS}
	@echo "${GREEN}📇  Compile finish..${NC}"

.c.o :
	@echo "${GREEN}📇  Compiling $<..${NC}"
	@${C} -c ${C_INCS} $< -o ${BUILDDIR}${subst /,_,$@}

clean : 
	@echo "${YELLOW}🗑️  Removing Objects..${NC}"
	@rm -rf ${BUILDDIR}*.o

fclean : clean
	@echo "${YELLOW}🗑️  Removing ${NAME}..${NC}"
	@rm -rf ${NAME}

re : fclean all

.PHONY : re clean fclean all
EOF

cat  << "EOF" > "$PROJECT_PATH/incs/main.h"
#ifndef __MAIN__H__
#define __MAIN__H__

int main();

#endif  //!__MAIN__H__
EOF

cat  << "EOF" > "$PROJECT_PATH/incs/utils/utils.h"
#ifndef __UTILS__H__
#define __UTILS__H__

void print_hello();

#endif  //!__UTILS__H__
EOF

cat  << "EOF" > "$PROJECT_PATH/srcs/utils/utils.c"
#include <stdio.h>

void print_hello()
{
	printf("hello\n");
}
EOF

cat  << "EOF" > "$PROJECT_PATH/srcs/main.c"
#include "main.h"
#include "utils.h"

int main()
{
	print_hello();
}
EOF

echo "C project created at $PROJECT_PATH"
echo "cd  $PROJECT_PATH && make"
