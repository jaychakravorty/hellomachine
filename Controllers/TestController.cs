using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace hellomachine.Controllers
{
    [ApiController]
    [Route("test")]
    public class WeatherForecastController : ControllerBase
    {
        [HttpGet]
        public string Get()
        {
           return $"Hello from webapi hosted at {Environment.MachineName}";
        }
    }
}
