using EXamenAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data.SqlTypes;

namespace EXamenAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonaController : ControllerBase
    {
        [HttpGet("{id?}")]
        public ActionResult Get(int? id) {
            using (Models.APPContext db = new Models.APPContext()) {
                //Ef With Stored Procedure
                var lst = db.personas.FromSqlRaw ($"SP_Persona_List { id ?? SqlInt32.Null }").ToList();
                return Ok(lst);
                //EF Pure
                //var lst = (from d in db.personas
                //           select d).ToList();
            }
        }
        [HttpPost]
        public ActionResult Post(persona per) {
            using (Models.APPContext db = new Models.APPContext()) {

                //Ef With Stored Procedure
                var res = db.Database.ExecuteSqlRaw($"sp_Persona_Reg {per.id}, '{per.nombre}', '{ per.apellido}', '{per.dni}', '{per.fecNacimiento}', '{per.direccion}', {Convert.ToInt32(per.estado)}");

                //EF Pure
                //if (ModelState.IsValid)
                //{
                //    db.Update(per);
                //    db.SaveChanges();
                //    return Ok();
                //}
                if(res == 1)
                    return Ok("se registro correctamente");

            }
            return Ok();
        }
        [HttpDelete("{id}")]
        public ActionResult Delete(int id) {
            using (Models.APPContext db = new Models.APPContext())
            {
                var res = db.Database.ExecuteSqlRaw($"SP_Persona_Del {id}");
                if (res == 1)
                    return Ok("se registro correctamente");
            }
            return Ok();
        }

    }
}
