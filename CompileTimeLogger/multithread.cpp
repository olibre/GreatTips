#include <vector>
#include <cstdio>
#include <mutex>
#include <thread>
#include <condition_variable>

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
  void print(int id, T value);
};

#define LOG(fmt,value) { static const OneLog log(__LINE__,fmt); logger.print(log.id,value); }

bool run = true;

int main (int argc, char **argv)
{
  Logger logger;
  for (int i = 0; i < argc+1; ++i)
  {
    LOG("argc   =%d",argc   );
    LOG("argv[0]=%s",argv[0]);
  }
  run = false;
}

/*
template <typename T>
void Logger::print(int id, T value)
{
  std::printf("\nLogID=%d at line=%d message=", id, g_logmetadata.logs[id].line);
  std::printf(g_logmetadata.logs[id].fmt, value);     
}
*/

template <typename T>
void Logger::print(int id, T value)
{
    static T static_value;
    static std::mutex m;
    std::condition_variable cv;
    static std::thread t([&]{
        while(run)
        {
            T local_value;
            {
                std::unique_lock<std::mutex> lk(m);
                cv.wait(lk);
                local_value = static_value;
            }
            std::printf("\nLogID=%d at line=%d message=", id, g_logmetadata.logs[id].line);
            std::printf(g_logmetadata.logs[id].fmt, local_value);
        }
    });
    {
        std::unique_lock<std::mutex> lk(m);
        static_value = value;
    }
    cv.notify_one();
}
