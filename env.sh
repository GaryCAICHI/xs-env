# This script will setup XiangShan environment variables

export XS_PROJECT_ROOT=$(pwd)
export NEMU_HOME=$(pwd)/NEMU
export AM_HOME=$(pwd)/nexus-am
export NOOP_HOME=$(pwd)/XiangShan
export DRAMSIM3_HOME=$(pwd)/DRAMsim3

# XiangShan and YunSuan use different Mill releases, but both are verified
# against OpenJDK 17 in this test branch. Prefer the standard Ubuntu JDK 17
# location when JAVA_HOME has not been selected explicitly.
if [ -z "${JAVA_HOME:-}" ] && [ -d /usr/lib/jvm/java-17-openjdk-amd64 ]; then
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
fi
if [ -n "${JAVA_HOME:-}" ]; then
  export PATH="${JAVA_HOME}/bin:${PATH}"
fi
if ! java -version 2>&1 | head -n 1 | grep -q '"17\.'; then
  echo "ERROR: OpenJDK 17 is required by the test build environment." >&2
  return 1 2>/dev/null || exit 1
fi

echo SET XS_PROJECT_ROOT: ${XS_PROJECT_ROOT}
echo SET NOOP_HOME \(XiangShan RTL Home\): ${NOOP_HOME}
echo SET NEMU_HOME: ${NEMU_HOME}
echo SET AM_HOME: ${AM_HOME}
echo SET DRAMSIM3_HOME: ${DRAMSIM3_HOME}
echo SET JAVA_HOME: ${JAVA_HOME}
