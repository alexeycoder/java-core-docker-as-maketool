SRC_DIR := src
OUT_DIR := out
DOC_DIR := docs
PKG_ROOT := ru
MAIN_CLS := ru.gb.jcore.sample.Main
JAR_FILE := my-sample.jar

JC := javac
JCFLAGS := -sourcepath ./$(SRC_DIR) -d $(OUT_DIR)
JI := java
JIFLAGS := -classpath $(OUT_DIR)/
JD := javadoc
JDFLAGS := -sourcepath ./${SRC_DIR} -classpath ./${OUT_DIR} -d ${DOC_DIR} -subpackages ${PKG_ROOT}
JAR := jar
JARFLAGS := -v -c -f ${JAR_FILE} -e ${MAIN_CLS} -C ${OUT_DIR}/ .

all:
	${JC} ${JCFLAGS} src/ru/gb/jcore/sample/Main.java

jar: all
	${JAR} ${JARFLAGS}

run: all
	${JI} ${JIFLAGS} ${MAIN_CLS}

runjar: jar
	${JI} -jar ${JAR_FILE}

docs: all
	${JD} ${JDFLAGS}

clean:
	rm -R ${OUT_DIR}

cleanall:
	rm -R ${OUT_DIR} ${DOC_DIR} ${JAR_FILE}