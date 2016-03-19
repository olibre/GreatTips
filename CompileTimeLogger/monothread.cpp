#include <vector>
#include <cstdio>

struct LogMetaData
{
  struct OneLogData { int line; const char* fmt; };
  std::vector<OneLogData> logs;
  
  int registering(int line, const char* fmt)
  {
    logs.push_back( OneLogData{line,fmt} );
    return logs.size() - 1;
  }                
};
static LogMetaData g_logmetadata;

struct OneLog
{
  OneLog(int line, const char *fmt)
  { id = g_logmetadata.registering (line, fmt); }
  int id;
};

struct Logger
{
  template <typename T>
  auto print(int id, T value)
  {
    std::printf("\nLogID=%d at line=%d message=", id, g_logmetadata.logs[id].line);
    std::printf(g_logmetadata.logs[id].fmt, value);     
  }
};

#define LOG(fmt,value) { static OneLog log(__LINE__,fmt); logger.print(log.id,value); } 

int main (int argc, char **argv)
{
  Logger logger;
  for (int i = 0; i < argc+1; ++i)
  {
    LOG("argc   =%d",argc   );
    LOG("argv[0]=%s",argv[0]);
  }
}
