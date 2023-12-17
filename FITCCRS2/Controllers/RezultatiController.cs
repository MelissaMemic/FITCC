﻿using FITCCRS2.Model.Requests.RezultatiRequest;
using FITCCRS2.Model.SearchObjects;
using FITCCRS2.Services.RezultatiService;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FITCCRS2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class RezultatiController : BaseCRUDController<Model.Rezultati, RezultatiSearchObject, RezultatiInsertRequest, RezultatiUpdateRequest>
    {
        public IRezultatiService _service { get; set; }
        public RezultatiController(IRezultatiService service):base(service)
        {
            _service = service;
        }

        [HttpGet("getAllRezultati")]
        public List<Model.Rezultati> getAllRezultati()
        {
            var list = _service.getAllRezultati();
            return list;
        }
    }
}
